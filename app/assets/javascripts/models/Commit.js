function Commit(params) { 
  this.id = params.id;
  this.number = params.number;
  this.parent_commit_id = params.parent_commit_id;
  this.notes = params.notes;
}
