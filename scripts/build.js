const path = require("path")
const markdown = require("./markdown")

TEMPLATES_DIR = path.join(process.env.INIT_CWD, "templates");
RESUME_DIR = path.join(process.env.INIT_CWD, "resume")

markdown.compile(
    path.join(TEMPLATES_DIR, "template.md.mustache"),
    path.join(RESUME_DIR, "ds", "ru", "resume.json"),
    path.join(RESUME_DIR, "ds", "ru", "resume.md")
);

markdown.compile(
    path.join(TEMPLATES_DIR, "template.md.mustache"),
    path.join(RESUME_DIR, "python-backend", "ru", "resume.json"),
    path.join(RESUME_DIR, "python-backend", "ru", "resume.md")
);
