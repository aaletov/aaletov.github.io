const fs = require("fs");
const Mustache = require("mustache");

function parseDate(date) {
    return {
        year: date.slice(0, 4),
        month: date.slice(5, 7),
        day: date.slice(8, 10),
    }
}

function dateMap(startDate, endDate) {
    const monthsMap = new Map([
        ["01", "Январь"],
        ["02", "Февраль"],
        ["03", "Март"],
        ["04", "Апрель"],
        ["05", "Май"],
        ["06", "Июнь"],
        ["07", "Июль"],
        ["08", "Август"],
        ["09", "Сентябрь"],
        ["10", "Октябрь"],
        ["11", "Ноябрь"],
        ["12", "Декабрь"],
    ]);

    const startDateParsed = parseDate(startDate);
    const endDateParsed = parseDate(endDate);

    const startDateText = monthsMap.get(startDateParsed.month) + " " + startDateParsed.year;
    const endDateText = monthsMap.get(endDateParsed.month) + " " + endDateParsed.year;

    return startDateText + " - " + endDateText;
}

function compile(template, resume, out) {
    templateSliced = template.split(".")
    if (templateSliced.pop() != "mustache") {
        throw Error("Not a mustache template");
    }

    const templateText = fs.readFileSync(template).toString("utf-8");
    const file = fs.readFileSync(resume);
    const resumeJson = JSON.parse(file);

    resumeJson.education.forEach(institution => {
        const startYear = institution.startDate.slice(0, 4)
        const endYear = institution.endDate.slice(0, 4)
        institution.institutionDates = startYear + "-" + endYear;
    });
    resumeJson.work.forEach(job => {
        job.jobDates = dateMap(job.startDate, job.endDate)
    });
    resumeJson.projects.forEach(project => {
        project.projectDates = dateMap(project.startDate, project.endDate)
    });

    fs.writeFileSync(out, Mustache.render(templateText, resumeJson))
}

module.exports = {
    "compile": compile,
}
