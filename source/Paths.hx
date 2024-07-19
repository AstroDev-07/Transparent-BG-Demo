package;

class Paths {

    private static var basePath:String = "assets/images/";

    public static function loadImage(filename:String):String {
        return basePath + filename + ".png";
    }
}