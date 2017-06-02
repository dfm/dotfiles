call ale#linter#Define('tex', {
\   'name': 'vale',
\   'executable': 'vale',
\   'command': 'vale --output=line %t',
\   'callback': 'ale#handlers#unix#HandleAsWarning',
\})
