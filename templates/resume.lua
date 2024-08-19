function texio.debug_nl (str)
    texio.write_nl("-----> " .. str)
    texio.write_nl("^^^")
end

function tex.printf (pattern, str)
    local formatted = string.format(pattern, str)
    tex.print(formatted)
end

function readResume (filename)
    local f = io.open(filename, "r")
    local s = f:read("*all")
    f:close()
    return json.decode(s)
end

function get_location (resumeJSON)
    return table.concat({resumeJSON.basics.location.city, resumeJSON.basics.location.region}, ", ")
end

function get_mail (resumeJSON)
    local mail = resumeJSON.basics.email
    local href = string.format("\\href{mailto:%s}{\\underline{%s}}", mail, mail)
    return href
end

function make_href (link)
    print_link = string.gsub(link, "https://", "")
    print_link = string.gsub(print_link, "www.", "")
    local href = string.format("\\href{https://%s}{\\underline{%s}}", link, print_link)
    return href
end

function get_profiles (resumeJSON)
    local contacts = ""
    -- while line not exceeded
    for i, profile in ipairs(resumeJSON.basics.profiles) do
        contacts = contacts .. make_href(profile.url)
        if i ~= table.getn(resumeJSON.basics.profiles) then
            contacts = contacts .. " \\textbar "
        end
    end
    return contacts
end

function parse_date (date)
    return {
        year=string.sub(date, 1, 4),
        month=string.sub(date, 6, 7),
        day=string.sub(date, 9, 10)
    }
end

function to_month_date (date)
    local month_from_number = {
        ["01"]="Январь",
        ["02"]="Февраль",
        ["03"]="Март",
        ["04"]="Апрель",
        ["05"]="Май",
        ["06"]="Июнь",
        ["07"]="Июль",
        ["08"]="Август",
        ["09"]="Сентябрь",
        ["10"]="Октябрь",
        ["11"]="Ноябрь",
        ["12"]="Декабрь"
    }
    return string.format("%s %s", month_from_number[date.month], date.year)
end


function make_education_heading (education)
    local institution = education.institution
    local location = ""
    local faculty = table.concat({education.studyType, education.area}, ", ")
    local start_year = parse_date(education.startDate).year
    local end_year = parse_date(education.endDate).year
    local dates = table.concat({start_year, end_year}, "-")
    local str_heading = string.format("\\resumeEducationHeading{%s}{%s}{%s}{%s}", institution, location, faculty, dates)
    return str_heading
end

function make_education_courses (education)
    local courses = ""
    for i, course in ipairs(education.courses) do
        courses = courses .. string.format("%s", course)
        if i ~= table.getn(resumeJSON.skills) then
            courses = courses .. ", "
        end
    end
    local str_courses = table.concat({"\\subsubsection{Курсы}:", courses}, " ")
    return str_courses
end

function get_education (resumeJSON)
    local education = make_education_heading(resumeJSON.education[1])
    texio.debug_nl(education)
    return education
end

function make_project_heading (project)
    local name = string.format("\\href{%s}{%s}", project.url, project.name)
    local parsed_start_date = (project.startDate) and to_month_date(parse_date(project.startDate)) or ""
    local parsed_end_date = (project.endDate) and to_month_date(parse_date(project.endDate)) or ""
    local dates = table.concat({parsed_start_date, parsed_end_date}, " -- ")
    local str_heading = string.format("\\resumeProjectHeading{\\textbf{%s}}{%s}", name, dates)
    return str_heading
end

function make_project_highlights (project)
    if project.highlights == nil then
        return ""
    end
    local item_list_start = "\\begin{projectHighlights}"
    local item_list_end = "\\end{projectHighlights}"
    local highlights = ""
    for i, highlight in ipairs(project.highlights) do
        highlights = highlights .. string.format("\\resumeExperienceHighlight{%s}", highlight)
    end
    local str_highlights = table.concat({project.description, item_list_start, highlights, item_list_end}, " ")
    return str_highlights
end

function make_project (project)
    return string.format("%s %s", make_project_heading(project), make_project_highlights(project))
end

function get_projects (resumeJSON)
    local projects = ""
    for i, project in ipairs(resumeJSON.projects) do
        projects = projects .. make_project(project)
    end
    texio.debug_nl(projects)
    return projects
end

function make_job_highlights (project)
    if project.highlights == nil then
        return ""
    end
    local item_list_start = "\\begin{jobHighlights}"
    local item_list_end = "\\end{jobHighlights}"
    local highlights = ""
    for i, highlight in ipairs(project.highlights) do
        highlights = highlights .. string.format("\\resumeExperienceHighlight{%s}", highlight)
    end
    local str_highlights = table.concat({project.summary, item_list_start, highlights, item_list_end}, " ")
    return str_highlights
end

function make_job_heading (job)
    local name = string.format("\\href{%s}{%s}", job.url, job.name)
    local location = job.location
    local position = job.position
    local parsed_start_date = (job.startDate) and to_month_date(parse_date(job.startDate)) or ""
    local parsed_end_date = (job.endDate) and to_month_date(parse_date(job.endDate)) or ""
    local dates = table.concat({parsed_start_date, parsed_end_date}, " -- ")
    local str_heading = string.format("\\resumeJobHeading{%s}{%s}{%s}{%s}", name, location, position, dates)
    return str_heading
end

function make_job (job)
    return string.format("%s %s", make_job_heading(job), make_job_highlights(job))
end

function get_jobs (resumeJSON)
    local jobs = ""
    for i, job in ipairs(resumeJSON.work) do
        jobs = jobs .. make_job(job)
    end
    return jobs
end

function get_skills (resumeJSON)
    local skills = ""
    for i, skill in ipairs(resumeJSON.skills) do
        local area = skill.name
        local subskills = table.concat(skill.keywords, ", ")
        skills = skills .. string.format("\\item[]\\textbf{%s}{: %s}\\vspace{-3pt}", area, subskills)
        if i ~= table.getn(resumeJSON.skills) then
            skills = skills .. "\\\\"
        end
    end
    return skills
end