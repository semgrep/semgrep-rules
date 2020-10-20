//https://github.com/mybb/mybb/blob/897593d36d2db00ac09dd0c0379595354538b85a/jscripts/bbcodes_sceditor.js
$(function ($) {
    'use strict';

    $.sceditor.formats.bbcode
        .set('align', {
            html: function (element, attrs, content) {
                // ruleid: raw-html-concat
                return '<div align="' + (attrs.defaultattr || 'left') + '">' + content + '</div>';
            },
            isInline: false
        });

      $.sceditor.formats.bbcode.set('quote', {
          format: function (element, content) {
              var author = '',
                  $elm = $(element),
                  $cite = $elm.children('cite').first();
              $cite.html($cite.text());
  
              if ($cite.length === 1 || $elm.data('author')) {
                  author = $cite.text() || $elm.data('author');
  
                  $elm.data('author', author);
                  $cite.remove();
  
                  content = this.elementToBbcode(element);
                  author = '=' + author.replace(/(^\s+|\s+$)/g, '');
  
                  $elm.prepend($cite);
              }
  
              if ($elm.data('pid'))
                  author += " pid='" + $elm.data('pid') + "'";
  
              if ($elm.data('dateline'))
                  author += " dateline='" + $elm.data('dateline') + "'";
  
              return '[quote' + author + ']' + content + '[/quote]';
          },
          html: function (token, attrs, content) {
              var data = '';
  
              if (attrs.pid)
                  // ruleid: raw-html-concat
                  data += ' data-pid="' + attrs.pid + '"';
  
              if (attrs.dateline)
                  // ruleid: raw-html-concat
                  data += ' data-dateline="' + attrs.dateline + '"';
  
              if (typeof attrs.defaultattr !== "undefined")
                  // ruleid: raw-html-concat
                  content = '<cite>' + attrs.defaultattr.replace(/ /g, '&nbsp;') + '</cite>' + content;
  
              return '<blockquote' + data + '>' + content + '</blockquote>';
          },
          quoteType: function (val, name) {
              var quoteChar = val.indexOf('"') !== -1 ? "'" : '"';
  
              return quoteChar + val + quoteChar;
          },
          breakStart: true,
          breakEnd: true
      });

});

//https://github.com/AmauriC/tarteaucitron.js/blob/92d0af3a93ed807f711862830bc4ead3d84a0752/tarteaucitron.js

var tarteaucitron = {
    "version": 20200730,
    "cdn": cdn,
    "user": {},
    "lang": {},
    "services": {},
    "added": [],
    "idprocessed": [],
    "state": [],
    "launch": [],
    "parameters": {},
    "isAjax": false,
    "reloadThePage": false,
    "events": {
        "init": function () {},
        "load": function () {},
    },
    "number": function () {
        "use strict";
        var cookies = document.cookie.split(';'),
            nb = (document.cookie !== '') ? cookies.length : 0,
            html = '';

        cookies = cookies.sort(function (a, b) {
            namea = a.split('=', 1).toString().replace(/ /g, '');
            nameb = b.split('=', 1).toString().replace(/ /g, '');
            c = (tarteaucitron.cookie.owner[namea] !== undefined) ? tarteaucitron.cookie.owner[namea] : '0';
            d = (tarteaucitron.cookie.owner[nameb] !== undefined) ? tarteaucitron.cookie.owner[nameb] : '0';
            if (c + a > d + b) { return 1; }
            if (c + a < d + b) { return -1; }
            return 0;
        });

        if (document.cookie !== '') {
            for (i = 0; i < nb; i += 1) {
                html += '<li class="tarteaucitronCookiesListMain">';
                // ruleid: raw-html-concat
                html += '    <div class="tarteaucitronCookiesListRight">' + cookies[i].split('=').slice(1).join('=') + '</div>';
                html += '</li>';
            }
        } else {
            html += '<div class="tarteaucitronCookiesListMain">';
            html += '    <div class="tarteaucitronCookiesListLeft"><strong>-</strong></div>';
            html += '    <div class="tarteaucitronCookiesListRight"></div>';
            html += '</div>';
        }
    }
};

//https://github.com/mbraak/jqTree/blob/d6b8d11c4ebd7aa4a60498786bc94724b6f6ffda/lib/dragAndDropHandler.js
var DragElement = /** @class */ (function () {
    function DragElement(nodeName, offsetX, offsetY, $tree) {
        this.offsetX = offsetX;
        this.offsetY = offsetY;
        // ruleid: raw-html-concat
        this.$element = jQuery("<span class=\"jqtree-title jqtree-dragging\">" + nodeName + "</span>");
        this.$element.css("position", "absolute");
        $tree.append(this.$element);
    }
    DragElement.prototype.move = function (pageX, pageY) {
        this.$element.offset({
            left: pageX - this.offsetX,
            top: pageY - this.offsetY
        });
    };
    DragElement.prototype.remove = function () {
        this.$element.remove();
    };
    return DragElement;
}());