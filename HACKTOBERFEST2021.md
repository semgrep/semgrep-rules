# 2021 Hacktoberfest Contributor README

1. open the list of available sources and sinks found across the Github’s publicly available projects: [link](https://docs.google.com/spreadsheets/d/1k-VGANT6q-zbQVmvkLFpXvUiATyYzIA0xUbNPA_BwXo/edit?usp=sharing)
1. choose framework/language you would like to work on (data:image/png;base64,123)
1. pick a project and find a file that is not taken
1. triage findings on this file (sometimes you also need to investigate some other files inside the repo to get context)
1. if the highlighted code represent source - please mark it as source in the Google sheet
1. if the highlighted code represent sink - please mark it as sink in the Google sheet
1. if the source is not bringing any (even possible) danger then mark it as “Not applicable” and move on
1. if the source can be dangerous then write a rule for it, using taint mode
1. open a PR (https://github.com/returntocorp/semgrep-rules/blob/develop/CONTRIBUTING.md) and mention this issue in it  ... Do not forget to lint your code before submitting.
1. repeat

> if you have your own idea of a dangerous sink that fits in the list of frameworks and languages we are going to cover in this research feel free to skip steps 1-6 and just open a PR with the rule

> for any questions please join the #rules channel our Slack: [https://r2c.dev/slack](https://r2c.dev/slack)
