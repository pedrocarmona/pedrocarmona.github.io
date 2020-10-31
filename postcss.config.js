const purgecss = require("@fullhuman/postcss-purgecss")({
    content: ["./src/**/*.html", "./src/**/*.md", "./src/**/*.liquid", "./frontend/**/*.js", "./src/_data/**/*.yml"],

    defaultExtractor: content => content.match(/[\w-/.:]+(?<!:)/g) || []
})

module.exports = {
    plugins: [
        require("postcss-import", {
            path: "frontend/styles",
            plugins: []
        }),
        require("tailwindcss"),
        require("autoprefixer"),
        ...(process.env.NODE_ENV == "production" ? [purgecss] : [])
    ]
}
