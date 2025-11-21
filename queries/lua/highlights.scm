;; extends

((identifier) @type
    (#match? @type "^_?[A-Z][a-z]")
    (#set! priority 128)
)

(dot_index_expression
    table: (identifier) @type
    (#match? @type "^_?[A-Z][a-z]")
    (#set! priority 128)
)

((identifier) @constant
  (#match? @constant "^[A-Z_][A-Z0-9_]*$")
  (#set! priority 128)
)

((identifier) @variable.builtin
    (#eq? @variable.builtin "vim")
    (#set! priority 128)
)
((identifier) @variable.builtin
    (#eq? @variable.builtin "fs")
    (#set! priority 128)
)
