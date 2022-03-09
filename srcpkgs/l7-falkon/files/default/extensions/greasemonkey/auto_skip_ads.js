// ==UserScript==
// @name         YouTube - Ad Skip, Close popup ad and Confirm presence
// @version      1.1
// @description  Skips and removes ads on YouTube automatically
// @author       Keyzee
// @match        https://www.youtube.com/watch*
// @grant        none
// @namespace    keyzee.youTubeAdSkipper
// @license      MIT
// ==/UserScript==



(function() {
    'use strict';
    function showmsg(msg) {
        var $div = document.createElement('div');
        $div.style = 'position:fixed;top:10px;left:10px;background:#e80000;color:#FFF;padding:15px 25px;z-index:999999999;max-width:80%';
        $div.innerHTML = msg;
        document.body.appendChild($div);
        setTimeout(function() {
            document.body.removeChild($div);
        }, 5000);
    }
    setInterval(function (){
        if(document.querySelector('.ytp-ad-skip-button-container')) {
            document.querySelector('.ytp-ad-skip-button-container').click();
        }
        if(document.querySelector('#confirm-button > a:nth-child(1) > paper-button:nth-child(1)')) {
            document.querySelector('#confirm-button > a:nth-child(1) > paper-button:nth-child(1)').click();
        }
        if(document.querySelector('.ytp-ad-overlay-close-button')) {
            document.querySelector('.ytp-ad-overlay-close-button').click();
        }
    }, 2500);
})();
