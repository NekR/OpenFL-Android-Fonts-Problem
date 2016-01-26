package;

import openfl.display.Sprite;
import openfl.Assets;
import openfl.Lib;

import openfl.text.TextField;
import openfl.text.TextFormat;
import openfl.text.TextFormatAlign;
import openfl.text.TextFieldType;
import openfl.text.Font;

import app.debug.Stats;

class Main extends Sprite {

  public static var fontName: String;
  public static var scaleRatio: Null<Float>;

  public function new() {
    super();

    var defaultFont = Assets.getFont('assets/fonts/Roboto-Regular.ttf');
    var font = defaultFont.fontName;

    trace(font);

    Lib.current.stage.align = openfl.display.StageAlign.TOP_LEFT;
    Lib.current.stage.scaleMode = openfl.display.StageScaleMode.NO_SCALE;

    // Set `scale` to 2 to increase size on Android (it reports wrong value)
    // var scale = Lib.current.stage.stageWidth / Lib.application.window.width;
    var scale = Lib.application.window.scale;

    Main.scaleRatio = scale;
    Main.fontName = font;

    initDebug();
  }

  public function initDebug() {
    var stats = new Stats({
      fontSize: 14,
      lineHeight: 16,
      fontName: Main.fontName,
      // fontName: '_sans',
      color: 0xffffff,
      width: 200
    });

    stats.x = 10;
    stats.y = 10;

    this.addChild(stats);
  }
}