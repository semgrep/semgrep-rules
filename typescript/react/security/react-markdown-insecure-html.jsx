import ReactMarkdown from "react-markdown";
import htmlParser from "react-markdown/plugins/html-parser";

// For more info on the processing instructions, see
// <https://github.com/aknuds1/html-to-react#with-custom-processing-instructions>
const parseHtml = htmlParser({
  isValidNode: (node) => node.type !== 'script',
  processingInstructions: [
    /* ... */
  ]
})

function bad1() {
// ruleid: react-markdown-insecure-html
    return <ReactMarkdown astPlugins={[parseHtml]} allowDangerousHtml children={markdown} />;
}

function bad2() {
// ruleid: react-markdown-insecure-html
    return <ReactMarkdown astPlugins={[parseHtml]} escapeHtml={false} children={markdown} />;
}

function ok1() {
// ok: react-markdown-insecure-html
    return <ReactMarkdown renderers={renderers} children={markdown} />;
}

function ok2() {
// ok: react-markdown-insecure-html
    return <ReactMarkdown renderers={renderers} escapeHtml={true} children={markdown} />;
}