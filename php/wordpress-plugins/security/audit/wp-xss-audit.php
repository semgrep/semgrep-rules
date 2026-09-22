<?php

$name = $_GET['name'];
// ruleid: wp-xss-audit
echo $name;

// ruleid: wp-xss-audit
echo $_POST['comment'];

// ruleid: wp-xss-audit
print $_REQUEST['search'];

$term = $_GET['term'];
// ruleid: wp-xss-audit
printf('<span>%s</span>', $term);

$paged = get_query_var('paged');
// ruleid: wp-xss-audit
echo $paged;

$page = $wp_query->get('paged');
// ruleid: wp-xss-audit
echo $page;

$title = get_option('site_tagline');
// ruleid: wp-xss-audit
echo $title;

$bio = get_user_meta(get_current_user_id(), 'bio', true);
// ruleid: wp-xss-audit
echo $bio;

// ok: wp-xss-audit
echo esc_html($_GET['name']);

// ok: wp-xss-audit
echo esc_attr(get_query_var('paged'));

// ok: wp-xss-audit
echo intval($wp_query->get('paged'));

// ok: wp-xss-audit
echo wp_kses_post($_POST['comment']);

// ok: wp-xss-audit
echo sanitize_text_field($_REQUEST['search']);

// ok: wp-xss-audit
echo esc_url($_GET['redirect']);

// ok: wp-xss-audit
echo '<span>Static markup</span>';

?>
