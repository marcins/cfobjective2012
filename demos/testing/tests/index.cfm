<cfscript>
testSuite = createObject("component","mxunit.framework.TestSuite").TestSuite();
testSuite.addAll("testPeopleController");
testSuite.addAll("testPeopleViews");
results = testSuite.run();
writeOutput(results.getResultsOutput('html'));
</cfscript>