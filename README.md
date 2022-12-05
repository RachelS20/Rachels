Assignment for MLOps candidates @ VVI - General Motors

- If you have any questions or issues, please create an issue in the Issues tab.
- If you want to remain discrete to other candidates please make sure to create a new github user for this task.

Story:
You were provided a menifest to mock a job for data recovery for PostgresSQL database. The code is incomplete and needs some additions and refactoring. Please read the task to the end and decide how you want to approrach the problem after you read all the requirements at least once.

1. add missing resource dependency 
> The job wants to recover the backups from somewhere, but the target might be missing. Try to make everything as safe and secure as possible (hints: assume that backup is encrypted. Restricion of access is a good idea)  
    >> [?]() Where should do_recover.sh be executed?

2. remove secrets from code
> The code contains hard coded credentials. It would be nice if they would be replaced with refrences, either from an encoded file or auto-generated secret on resource definition (hint: anything goes, feel free to implement anything that makes semse, just make sure to delete the hard coded secrets)

3. job execution schedule
> The job is currently is scheduled manually. Business wants to verify that indeed data recovery process is healthy every Sunday.  
    >> [?]() If a job fails in pre-prod, should we still run it in prod? why?  
    >> [?]() How will you test that recovery was successful?

4. add parameters for multi-environment
> This job will probably run in multiple envs, it might be a good idea to parameterize as much as possible to replace variables with refrences so that the code will be *DRY

5. make it a module
>We want to apply best practises to our code. Turn your implementation into a module.  
    >> 5.1 We'll be able to refrence this module  
    >> 5.2 We'll be able to check outputs  
    >> 5.3 Write some tests to verify validity of your module


Please provide your solution, comments and corrections in code. You may use terraform (or any framework of your prefrence).
Answers to the questions may be inserted or added to this document or another text file.

DRY = "don't repeat yourself", which basically means that code should try to avoid duplications whenever possible. It is the opposite of WET coding, which probably means something like "write everything twice", "we enjoy typing" or "waste everyone's time".
