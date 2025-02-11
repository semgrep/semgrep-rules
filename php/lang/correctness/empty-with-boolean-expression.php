<?php

// ok: empty-with-boolean-expression
if (!empty($params['name']) && !empty($params['pass'])) {
}
// ruleid: empty-with-boolean-expression
elseif (!empty($params['name'] && !empty($params['pass']))) {
}

// ok: empty-with-boolean-expression
if (!empty($params['name']) || !empty($params['pass'])) {
}
// ruleid: empty-with-boolean-expression
elseif (!empty($params['name'] || !empty($params['pass']))) {
}