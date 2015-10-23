// The MIT License (MIT)
//
// Copyright (c) 2015 Ivan Vorobei (ivanvorobei@icloud.com)
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in all
// copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
// SOFTWARE.

import AudioToolbox

public class audioPlayer: NSObject {
    var fileName : String?
    var enabled : Bool = true
    
    override init() {}
    
    init(fileName file: String) {
        self.fileName = file
    }
    
    public func playSound(soundFile:String) {
        if !enabled {
            return
        }
        if let url = NSBundle.mainBundle().URLForResource(soundFile, withExtension: nil) {
            var soundID : SystemSoundID = Internal.cache[url] ?? 0
            if soundID == 0 {
                AudioServicesCreateSystemSoundID(url, &soundID)
                Internal.cache[url] = soundID
            }
            AudioServicesPlaySystemSound(soundID)
        } else {
            print("Could not find sound file name `\(soundFile)`")
        }
    }
    
    func play() {
        if let filename = fileName {
            self.playSound(filename)
        }
    }
    
    private struct Internal {
        static var cache = [NSURL:SystemSoundID]()
    }
}