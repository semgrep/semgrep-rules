# Contributions

We welcome contributions to this repo! Please fork and make a pull request; we'll contact you about signing our CLA.

We're happy to help [semgrep@r2c.dev](mailto:semgrep@r2c.dev)

## Development Workflow

Before each commit,
git should run [`pre-commit`](https://pre-commit.com/)
to ensure files are well-formatted
and check for basic linting bugs.
If you don't have `pre-commit` installed,
the following command will do so for you:

```
$ python -m pip install pre-commit
```

Our `pre-commit` configuration uses Docker images.
Please ensure you have [Docker installed](https://docs.docker.com/get-docker/)
before running `pre-commit`.
Install the `pre-commit` hooks with the following command:

```
$ pre-commit install
```

To check if `pre-commit` is working as expected,
run the following command:

```
$ pre-commit run --all
```

Once `pre-commit` is set up
you may commit code and create pull requests as you would expect.
Pull requests require approval of at least one maintainer
and [CI to be passing](https://github.com/returntocorp/semgrep-rules/actions).
