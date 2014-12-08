var SAMPLE_PATH = "../assets/"
var tempo;
var audioBuffers;
var semi;

$(function(){
  tempo =  $("meta[property=projectTempo]").attr("content");
  console.log(tempo);
  beat = 60 / tempo;
  console.log(beat);
  semi = beat / 16.0;
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
  // We'll start playing the rhythm 100 milliseconds from "now"
  var startTime = context.currentTime + 0.100;
  // var tempo = 80; // BPM (beats per minute)
  var eighthNoteTime = (60 / tempo) / 2;

  // Play 2 bars of the following:
  for (var bar = 0; bar < 4; bar++) {
console.log("INIT");

    var time = startTime + bar * 8 * semi;

    for(var click = 0; click < 16; click++){
      triggerArrays.forEach(function(triggerArray) { 
        triggerArray.forEach(function(trigger){
          console.log(trigger)
          if(trigger.position == click){
            console.log("PLaying")
            playSound(audioBuffers[triggerArrays.indexOf(triggerArray)]) 
          }
        })
      });
    }
    // triggerArrays.forEach(function(triggerArray) { 
    //   triggerArray.forEach(function(trigger){
    //     console.log(audioBuffers[triggerArrays.indexOf(triggerArray)])
    //     console.log("THIS IS THE INDED " + triggerArrays.indexOf(triggerArray))
    //     console.log("This is the position value "+trigger.position % 16);
    //     playSound(audioBuffers[triggerArrays.indexOf(triggerArray)], time + ((trigger.position % 16) * semi) )


    
    // var time = startTime + bar * 8 * eighthNoteTime;
    // // Play the bass (kick) drum on beats 1, 5
    // playSound(this.kick, time);
    // playSound(this.kick, time + 4 * eighthNoteTime);

    // // Play the snare drum on beats 3, 7
    // playSound(this.snare, time + 2 * eighthNoteTime);
    // playSound(this.snare, time + 6 * eighthNoteTime);

    // // Play the hi-hat every eighthh note.
    // for (var i = 0; i < 8; ++i) {
    //   playSound(this.hihat, time + i * eighthNoteTime);
    // }
  }
};

function playSound(buffer, time) {
  var source = context.createBufferSource();
  source.buffer = buffer;
  source.connect(context.destination);
  source.start();
  // source[source.start ? 'start' : 'noteOn'](time);
}

