    <?php 
    function unLinklandingPage() {
        $nonce = isset($_REQUEST['nonce']) ? $_REQUEST['nonce'] : '';
        if (!current_user_can('edit_pages') || !wp_verify_nonce($nonce, 'aweber_unlink_page')) {
            wp_send_json_error('Unauthorized', 403);
        }

        $post_id = $_POST['post_id'];
        $landing_page_id = $_POST['landing_page_id'];

        $links = get_option('aweber_landing_page_links');
        if (isset($links[$landing_page_id])) {
            # Get post content before linking to AWeber Landing Pages.
            $previous_post = $this->getPreviousPostContent($post_id);
            if (empty($previous_post)) {
                $post_data = array(
                    'post_content'  => '<div><h3 class="aweber-page-not-reverted">
                    The customer page could not be reverted</h3></div>',
                );
            } else {
                $title = preg_replace_callback("/\([^)]+\)/",
                            array($this, "validISO8601Date"), $previous_post['post_title']);
                $post_data = array(
        'post_author'   => $previous_post['post_author'],
                    'post_content'  => $previous_post['post_content'],
                    'page_template' => $previous_post['page_template'],
                    'post_title'    => $title,
                    'post_excerpt'  => $previous_post['post_excerpt'],
                    'comment_status'=> $previous_post['comment_status'],
                    'ping_status'   => $previous_post['ping_status'],
                    'post_password' => $previous_post['post_password'],
                    'to_ping'       => $previous_post['to_ping'],
                    'pinged'        => $previous_post['pinged'],
                    'post_content_filtered' => $previous_post['post_content_filtered'],
                    'post_parent'   => $previous_post['post_parent'],
                    'menu_order'    => $previous_post['menu_order'],
                    'post_mime_type'=> $previous_post['post_mime_type'],
                    'comment_count' => $previous_post['comment_count']
                );
            }
            $post_data['ID'] = $post_id;
            $response = $this->updatePageData($landing_page_id, $post_data);
            if ($response['status'] == 'success') {
                unset($links[$landing_page_id]);
                update_option('aweber_landing_page_links', $links);
            }
        }
        echo json_encode($response);
        $this->_end_response();
    }

    
 function getPreviousPostContent($post_id) {
        $current_post = get_post($post_id);
        # Parse the URL and get the query param.
        $query_param = parse_url($current_post->guid, PHP_URL_QUERY);

        global $wpdb;

        # By using the guid value from current_post, get the previous post_id.
        $query = " SELECT * FROM " . $wpdb->prefix . "posts
            WHERE ID != " . $post_id . " AND post_status NOT IN ('trash', 'inherit')
                AND guid LIKE '%?" . $query_param . "' ORDER BY ID DESC LIMIT 1";
        $previous_post = $wpdb->get_results($query);
        if (empty($previous_post)) {
            return False;
        }
        # Get the first record and convert to array. 
        $previous_post = (array) $previous_post[0];
        # returns an empty string when the value of the page_template is either empty or 'default'.
        $page_template = get_page_template_slug($previous_post['ID']);
        if (empty($page_template)) {
            $previous_post['page_template'] = 'default';
        } else{
            $previous_post['page_template'] = $page_template;
        }

        # Now delete the previous Post. True => Force delete
        # wp_delete_post($previous_post['ID'], true);

        # Return the content of the Previous post.
        return $previous_post;
    }

    ?>