##################### Variable expansion #############################

# ruleid: unquoted-variable-expansion-in-command
exec $foo

# ruleid: unquoted-variable-expansion-in-command
exec $FOO

# ruleid: unquoted-variable-expansion-in-command
exec ${foo}

# ruleid: unquoted-variable-expansion-in-command
exec $1

# ruleid: unquoted-variable-expansion-in-command
exec ${foo%.bar}

# ruleid: unquoted-variable-expansion-in-command
exec $foo.bar

# ruleid: unquoted-variable-expansion-in-command
exec ${foo}.bar

# ok: unquoted-variable-expansion-in-command
exec "$foo"

# ok: unquoted-variable-expansion-in-command
exec "$FOO"

# ok: unquoted-variable-expansion-in-command
exec "${foo}"

# ok: unquoted-variable-expansion-in-command
exec "$1"

# ok: unquoted-variable-expansion-in-command
exec "${foo%.bar}"

# ok: unquoted-variable-expansion-in-command
exec "${foo}.bar"

# ok: unquoted-variable-expansion-in-command
exec "${foo}".bar

# ok: unquoted-variable-expansion-in-command
exec "$foo".bar

# ok: unquoted-variable-expansion-in-command
x=$foo

# ok: unquoted-variable-expansion-in-command
PATH=$foo:$PATH bar

# Expands without splitting (if IFS wasn't tempered with)
# ok: unquoted-variable-expansion-in-command
echo $$

# Special exception for semgrep users: $_foo is tolerated.
# ok: unquoted-variable-expansion-in-command
echo $_foo

##################### Command substitution #############################

# ruleid: unquoted-command-substitution-in-command
exec $(foo)

# ruleid: unquoted-command-substitution-in-command
exec `foo`

# ruleid: unquoted-command-substitution-in-command
exec $(foo)bar

# ruleid: unquoted-command-substitution-in-command
exec bar$(foo)

# ruleid: unquoted-command-substitution-in-command
exec bar$(foo)bar

# ruleid: unquoted-command-substitution-in-command
exec bar`foo`bar

# ok: unquoted-command-substitution-in-command
exec "$(foo)"

# ok: unquoted-command-substitution-in-command
exec "`foo`"

# ok: unquoted-command-substitution-in-command
exec "bar$(foo)bar"

# ok: unquoted-command-substitution-in-command
x=$(foo)

# Assignment from arithmetic expression
# ok: unquoted-command-substitution-in-command
x=$((foo++))

# This expression used to trigger
# ok: unquoted-command-substitution-in-command
echo $((2 + 2))

# Real world case that used to trigger this
# ok: unquoted-command-substitution-in-command
printf '%-*s enter %s\n' $((call_count++)) '->' "$1"
