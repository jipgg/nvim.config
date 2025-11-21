--- @type vim.lsp.Config
return {
    settings = {
        schemas = {
            {
                name = "default.project.json",
                description = "JSON schema for Rojo project files",
                fileMatch = { "*.project.json" },
                url =
                "https://raw.githubusercontent.com/rojo-rbx/vscode-rojo/master/schemas/project.template.schema.json",
            },
            {
                name = 'CMakePresets.json',
                description = "JSON schema for CMake presets",
                url =
                'https://raw.githubusercontent.com/Kitware/CMake/refs/heads/master/Help/manual/presets/schema.json',
            }
        },
        validate = { enabled = true },
    }
}
