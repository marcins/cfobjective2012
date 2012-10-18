<cfscript>
testSuite = createObject("component","mxunit.framework.TestSuite").TestSuite();
testSuite.addAll("testPeopleController");
results = testSuite.run();
writeOutput(results.getResultsOutput('html'));
</cfscript>