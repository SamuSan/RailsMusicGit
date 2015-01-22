function Commit(params) { 
  console.log(params);
  this.id = params.id;
  this.number = params.number;
  this.parent_commit_id = params.parent_commit_id;
  this.next_commit_id = params.next_commit_id;
  this.notes = params.notes;
}
