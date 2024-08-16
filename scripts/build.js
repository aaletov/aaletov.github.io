const path = require("path")
const markdown = require("./markdown")

TEMPLATES_DIR = path.join(process.env.INIT_CWD, "templates");
RESUME_DIR = path.join(process.env.INIT_CWD, "resume", "ru")

markdown.compile(
    path.join(TEMPLATES_DIR, "template.md.mustache"),
    path.join(RESUME_DIR, "resume.json"),
    path.join(RESUME_DIR, "resume.md")
);
