var SAMPLE_PATH = "../assets/"
var tempo;
var audioBuffers;
var semi;

$(function(){
  tempo =  $("meta[property=projectTempo]").attr("content");
  console.log(tempo);
  beat = 60 / tempo;
  console.log(beat);
  semi = beat / 4;
});

var DrumMachine = function() {
  loadSounds(this, {
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
  });
};

DrumMachine.prototype.play = function(triggerArrays) {
  audioBuffers = [this.cymbal,this.cabasa, this.clave, this.cowbell, this.ohat, this.hihat, this.clap, this.snare,this.sidestick, this.kick];
  var startTime = context.currentTime + 0.100;

  for (var bar = 0; bar < 4; bar++) {
    var time = startTime + bar * 16 * semi;

    triggerArrays.forEach(function(triggerArray) { 
      triggerArray.forEach(function(trigger){
        playSound(audioBuffers[triggerArrays.indexOf(triggerArray)], time + ((trigger.position % 16) * semi) )
      });
    });  
  }
};

function playSound(buffer, time) {
  var source = context.createBufferSource();
  source.buffer = buffer;
  source.connect(context.destination);
  source[source.start ? 'start' : 'noteOn'](time);
}

