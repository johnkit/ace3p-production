# ACE3P Production

A collection of scripts and notes associated with building and packaging modelbuilder for ACE3P users.


## To run UI tests

The files in `docs/` folder are configured as github pages, url https://johnkit.github.io/ace3p-production/. They can also be served locally using, for example, the python http.server module.


## To generate UI test files

The source files for the ui-testing web pages are generated in the `/test/ui` folder. Test specs are written in yml files in the `/test/ui/specs` folder. Run the `tests/ui/compile_tests.py` script to convert each yml file to a json file in the `/docs/ui-testing/data` folder and generate a `/docs/ui-testing/testNames.js` file.

To develop UI tests, more details can be found in `/test/ui/DEVELOP.md`.
