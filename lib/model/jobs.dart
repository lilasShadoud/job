class Jobs1 {
  final String jobname;
  final String companyname;
  final String country;
  final String job;
  final String jobtype;
  

  Jobs1(this.jobname, this.companyname, 
  this.country, this.job, this.jobtype ,
  );
  factory Jobs1.fromJson(jsonData)
  {
    
    return Jobs1(
      jsonData
   ['jobname']
   ,['companyname'].last
   ,['country'] .toString()
   ,['job'] .toString()
   ,['jobtype'] .toString()
  );
  }
}