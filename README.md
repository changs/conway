# conway

Conway's law
> Any piece of software reflects the organizational structure that produced it.

A [study](http://research.microsoft.com/apps/mobile/Publication.aspx?id=70535) that has been done at Microsoft concluded that
>the prediction models built using organizational metrics against traditional code churn, code complexity, code coverage, code dependencies and pre-release defect measures to show that organizational metrics are better predictors of failure-proneness than the traditional metrics used so far.

This utility tries to measure some of the organizational metrics. Together with a code analysis tool it provides an accurate predictions of failure-proneness in software.
It checks all files in GIT repository and show statistics for them.

## Usage

To run the script, copy it to somewhere in $PATH and then run it from the directory of your project. 

## Example output:

    app/models/membership.rb
    Contributors: 24
    Total edits: 83
    1st contributor edits: 10
    2nd contributor edits: 9

    app/models/user.rb
    Contributors: 27
    Total edits: 164
    1st contributor edits: 25
    2nd contributor edits: 12

## Conclusions

Based on that, one can conclude that there are a few problems with those files.
* The number of contributors is large, which means that the developer rotation in the organization is also probably too big which usually affects knowledge retention and thus quality.
* There probably isn't a single person that has the responsibility over those files.
* Big number of total edits suggests that the code is not respecting the single responsibility principle.
* Big number of total edits may also suggests that the requirements change a lot and/or there is a lack of stability.

To analyze the numbers one need to scale them accordingly to the size of the organization and the project. A project that last a year has different sensible value of total edits than a project that last 10 years.

