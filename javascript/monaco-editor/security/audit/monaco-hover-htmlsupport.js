import { editor, languages, Range } from "monaco-editor";

function test1 (userInput) {
  languages.registerHoverProvider('mySpecialLanguage', {
    provideHover: function (model) {
      return {
        range: new Range(1, 1, model.getLineCount(), model.getLineMaxColumn(model.getLineCount())),
        contents: [
          // ruleid:monaco-hover-htmlsupport
          {
            value: `<a href="${userInput}">Hello</a>`,
            supportHtml: true,
            isTrusted: true
          },
        ]
      }
    }
  });
}

function okTest1 () {
  languages.registerHoverProvider('mySpecialLanguage', {
    provideHover: function (model) {
      return {
        range: new Range(1, 1, model.getLineCount(), model.getLineMaxColumn(model.getLineCount())),
        contents: [
          {
            value: `<a href="//google.com">Hello</a>`,
            supportHtml: true,
            isTrusted: true
          },
        ]
      }
    }
  });
}

function okTest2 (userInput) {
  languages.registerHoverProvider('mySpecialLanguage', {
    provideHover: function (model) {
      return {
        range: new Range(1, 1, model.getLineCount(), model.getLineMaxColumn(model.getLineCount())),
        contents: [
          {
            value: `** Hello ${userInput}`,
          },
        ]
      }
    }
  });
}
