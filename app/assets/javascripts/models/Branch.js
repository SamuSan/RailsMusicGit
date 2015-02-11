function Branch(params) {
  console.log(params)
  this.id = params.id;
  this.name = params.name;
  this.headCommitId = params.head_commit_id;
}