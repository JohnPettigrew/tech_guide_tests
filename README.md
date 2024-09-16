This repo contains tests for the Parkinson's Uk Tech Guide website, following a behaviour-driven-development (BDD) approach and built on the TestEvolve platform. This provides an installable environment for creating, recording and running tests.

To run the tests, you need Cucumber and Ruby installed. To develop new tests, you just need a code editor. But the best solution is to install [Flare Studio from TestEvolve](https://www.testevolve.com/downloads). This requires Ruby (currently 3.3.4), and provides the visual test recorder as well as the test runner.

Test results for production runs and accessibility audits are reported via TestEvolve [Halo](https://parkinsonsuk.testevolve.io/node/a31661e9-0e41-41cd-bf5d-585b6a732e8b?project=1) (login required).

If you push to this repo, you must follow the same coding practices already in place. (If you use the visual test recorder in Flare Studio, it will do this automatically. Apart from the "readable Ruby" part!)

* use page objects to model the web page - don't put HTML logic into the test definitions; and
* EITHER create your step definitions using the TestEvolve recorder;
* OR use well-formed and readable Ruby to create your definitions.

NB Some tests require account-signin information. This is stored locally in a `.env` file that is not committed to git, for security. Contact the repo owner for the keys you need to add to this file (if it's not clear from the error messages!).

The repo is owned by John Pettigrew, Senior Product Manager - Tech Guide. PRs will only be accepted from our team, but please do fork the repo if you find the approach useful for your own tests!
