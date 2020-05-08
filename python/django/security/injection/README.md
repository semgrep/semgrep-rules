To generate rules with the injection template:

1. Run `pipenv install --dev` from the repo root.
1. Run `pipenv shell` from the repo root.
1. In this directory, run:
```
./generate-injection.py --id YOUR_ID --sink YOUR_SINK --message YOUR_MESSAGE > RULE_FILE
```
1. Profit

A todo item is to automate rule generation :)
