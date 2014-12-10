window.DrumMachine = new function() {
  var SAMPLE_PATH = "../assets/"
  var playing = false;
  var sampler = {};
  var audioBuffers;
  var audioSources = [];
  var self = this;
  var startOffset = 0.0500;

  $(document).ready(function() {
    self.tempo = $("meta[property=projectTempo]").attr("content");
    self.beat        = 60 / parseFloat(self.tempo);
    self.semi        = self.beat / 4;
  });

  this.play = function() {
    playing = true;

    if (!audioBuffers) {
      loadSounds(cueBuffers)
    }
    else{
      cueBuffers();
    };
  };

  this.stopPlaying = function() {
    audioSources.forEach(function(source) {
      source.stop();
    });
    playing = false;
  };

  this.isPlaying = function() {
    return playing;
  };

  var cueBuffers = function(){
   var startTime = context.currentTime + startOffset;

    for (var bar = 0; bar < 4; bar++) {
    var triggerArrays = PlayerSequencer.prepareNotesArray(Notes.notesInPlayer()); 
      var time = startTime + bar * 16 * self.semi;
      triggerArrays.forEach(function(triggerArray) { 
        triggerArray.forEach(function(trigger){
          onCueBuffers(audioBuffers[triggerArrays.indexOf(triggerArray)], time + ((trigger.position % 16) * self.semi) )
        });
      });  
    }
  };

  var onCueBuffers = function(buffer, time) {
    var source = context.createBufferSource();
    source.buffer = buffer;
    source.connect(context.destination);
    audioSources.push(source);
    source[source.start ? 'start' : 'noteOn'](time);
  };

  var loadSounds = function(callback) {
    SamplerSetup.loadSounds(sampler, {
      cymbal:   SAMPLE_PATH + "ridecym808.wav",
      cabasa:   SAMPLE_PATH + "cabasa808.wav",
      clave :   SAMPLE_PATH + "clave808.wav",
      cowbell:  SAMPLE_PATH + "cowbell808.wav",
      ohat:     SAMPLE_PATH + "openhat808.wav",
      hihat:    SAMPLE_PATH + "clsdhat808.wav",
      clap:     SAMPLE_PATH + "claps808.wav",
      snare:    SAMPLE_PATH + "snare808.wav",
      sidestick: SAMPLE_PATH + "sidestick808.wav", 
      kick:     SAMPLE_PATH + "kick808.wav"
    }, function(){
        audioBuffers = [
          sampler.cymbal,
          sampler.cabasa,
          sampler.clave,
          sampler.cowbell,
          sampler.ohat,
          sampler.hihat,
          sampler.clap,
          sampler.snare,
          sampler.sidestick,
          sampler.kick
        ];
      callback();      
    });
  };
};