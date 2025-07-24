return function(aliases)
    return {
        platform = {
            type = "standard",
        },
        require = {
            mode = "relativeToFile",
            directoryAliases = aliases,
        },
        sourcemap = {
            enabled = false,
            autogenerate = false,
        },
        index = {
            enabled = true,
        },
        hover = {
            strictDatamodelTypes = false,
        },
        diagnostics = {
            --strictDatamodelTypes = true,
            includeDependents = true,
        },
        imports = {
            requireStyle = "auto",
            suggestRequires = true,
            suggestServices = true,
        },
        plugin = {
            enabled = false,
        },
    }
end

