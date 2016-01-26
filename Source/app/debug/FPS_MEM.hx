package app.debug;

import haxe.Timer;
import openfl.display.FPS;
import openfl.events.Event;
import openfl.system.System;
import openfl.text.TextField;
import openfl.text.TextFormat;

class FPS_MEM extends TextField {
  private var times:Array<Float>;
  private var memPeak:Float = 0;

  public function new() {
    super();

    this.text = '';

    this.times = [];
    this.addEventListener(Event.ENTER_FRAME, this.onFrame);
  }

  private function onFrame(_) {
    var now = Timer.stamp();

    times.push(now);

    while (times[0] < now - 1) {
      times.shift();
    }

    var mem:Float = Math.round(System.totalMemory / 1024 / 1024 * 100) / 100;

    if (mem > this.memPeak) {
      this.memPeak = mem;
    }

    if (this.visible) {
      text = 'FPS: ' + times.length + '\nMEM: ' + mem + ' MB\nMEM peak: ' + memPeak + ' MB';
    }
  }
}