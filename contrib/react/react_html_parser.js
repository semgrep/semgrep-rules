
import ReactHtmlParser from 'react-html-parser';


renderContent() {
    let content = this.props.content;
    if (!content || (typeof content === 'string' && !content.length)) {
        if (this.props.children) {
            return <span>{this.props.children}</span>;
        }
        return null;
    }
    // ruleid:react_html_parser
    return <span>{ReactHtmlParser(content)}</span>;
}
