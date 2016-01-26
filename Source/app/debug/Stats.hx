package app.debug;

import openfl.display.Sprite;
import openfl.Lib;
import openfl.system.Capabilities;
import openfl.text.TextField;
import openfl.text.TextFormat;
import openfl.text.TextFormatAlign;
import openfl.text.TextFieldType;
import openfl.events.Event;

import lime.system.System;
import lime.system.Display;
import lime.system.DisplayMode;

import app.debug.FPS_MEM;

typedef Params = {
  var fontSize: Int;
  var lineHeight: Int;
  var fontName: String;
  var color: Int;
  var width: Int;
}

class Stats extends Sprite {
  public function new(params:Params) {
    super();

    trace(params.fontName);

    var fieldsFormat = new TextFormat(params.fontName, Math.round(params.fontSize * Main.scaleRatio), params.color);
    var display = System.getDisplay(0);
    var displayMode = display.currentMode;

    var dpiField = new TextField();
    var widthField = new TextField();
    var heightField = new TextField();
    var winWidthField = new TextField();
    var winHeightField = new TextField();
    var displayWidthField = new TextField();
    var displayHeightField = new TextField();
    var disModeWidthField = new TextField();
    var disModeHeightField = new TextField();
    var fpsMem = new FPS_MEM();

    var lineHeight = params.lineHeight * Main.scaleRatio;
    var width = params.width * Main.scaleRatio;

    fpsMem.height = lineHeight * 4;

    dpiField.type = TextFieldType.INPUT;
    fieldsFormat.align = TextFormatAlign.LEFT;

    var fields:Array<TextField> = [
      dpiField,
      widthField,
      heightField,
      winWidthField,
      winHeightField,
      displayWidthField,
      displayHeightField,
      disModeWidthField,
      disModeHeightField,

      // should be last
      fpsMem
    ];

    var index = 0;

    for (field in fields) {
      field.defaultTextFormat = fieldsFormat;
      field.width = width;
      field.x = 0;
      field.y = index * lineHeight;

      index++;

      this.addChild(field);
    }

    function resize(e:Null<Event>) {
      // dpiField.text = 'DPI: ' + Capabilities.screenDPI;
      // dpiField.text = 'DPI: ' + Lib.current.stage.stageWidth / Lib.application.window.width;
      dpiField.text = 'DPI: ' + Main.scaleRatio;
      widthField.text = 'Stage width: ' + Lib.current.stage.stageWidth;
      heightField.text = 'Stage height: ' + Lib.current.stage.stageHeight;

      winWidthField.text = 'Win width: ' + Lib.application.window.width;
      winHeightField.text = 'Win height: ' + Lib.application.window.height;

      displayWidthField.text = 'Display width: ' + display.bounds.width;
      displayHeightField.text = 'Display height: ' + display.bounds.height;

      disModeWidthField.text = 'DisplayMode width: ' + displayMode.width;
      disModeHeightField.text = 'DisplayMode height: ' + displayMode.height;
    }

    Lib.current.stage.addEventListener(Event.RESIZE, resize);
    resize(null);
  }
}