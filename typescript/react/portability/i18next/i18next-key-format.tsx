// ruleid: i18next-key-format
t('key', 'default value to show');

// ruleid: i18next-key-format
i18next.t('name');

// from different namespace (not recommended with namespace prefix when used in combination with natural language keys)
// ruleid: i18next-key-format
i18next.t('common:button.save') // -> "save"
// better use the ns option:
// ruleid: i18next-key-format
i18next.t('button.save', { ns: 'common' }) // -> "save"

// const error = '404';
// ruleid: i18next-key-format
t([`error.${error}`, 'error.unspecific']); // -> "The page was not found"

// const error = '502';
// ruleid: i18next-key-format
i18next.t([`error.${error}`, 'error.unspecific']); // -> "Something went wrong"

// ruleid: i18next-key-format
i18next.t('key', { what: 'i18next', how: 'great' });
// ruleid: i18next-key-format
i18next.t('keyEscaped', { myVar: '<img />' });
// -> "no danger &lt;img &#x2F;&gt;"

// ruleid: i18next-key-format
i18next.t('keyUnescaped', { myVar: '<img />' });
// -> "dangerous <img />"

// ruleid: i18next-key-format
i18next.t('keyEscaped', { myVar: '<img />', interpolation: { escapeValue: false } });
// -> "no danger <img />" (obviously could be dangerous)

// ruleid: i18next-key-format
i18next.t('intlNumber', { val: 1000 });
// --> Some 1,000
// ruleid: i18next-key-format
i18next.t('intlNumber', { val: 1000.1, minimumFractionDigits: 3 });
// --> Some 1,000.100
// ruleid: i18next-key-format
i18next.t('intlNumber', { val: 1000.1, formatParams: { val: { minimumFractionDigits: 3 } } });
// --> Some 1,000.100
// ruleid: i18next-key-format
i18next.t('intlNumberWithOptions', { val: 2000 });
// --> Some 2,000.00
// ruleid: i18next-key-format
i18next.t('intlNumberWithOptions', { val: 2000, minimumFractionDigits: 3 });
// --> Some 2,000.000


// ok: i18next-key-format
i18next.t('core.email.key', 'default value to show');

// ok: i18next-key-format
i18next.t('core.email.name');

// from different namespace (not recommended with namespace prefix when used in combination with natural language keys)
// ruleid: i18next-key-format
i18next.t('common:core.email.save') // -> "save"
// better use the ns option:
// ok: i18next-key-format
i18next.t('core.email.button.save', { ns: 'common' }) // -> "save"

// const error = '404';
// ruleid: i18next-key-format
t([`core.email.error.${error}`, 'error.unspecific']); 
// ok: i18next-key-format
t([`core.email.error.${error}`, 'core.error.unspecific']); 

// const error = '502';
// ruleid: i18next-key-format
i18next.t([`core.email.error.${error}`, 'error.unspecific']); // -> "Something went wrong"
// ok: i18next-key-format
i18next.t([`core.email.error.${error}`, 'core.error.unspecific']); // -> "Something went wrong"

// ok: i18next-key-format
i18next.t('core.email.key', { what: 'i18next', how: 'great' });
// ok: i18next-key-format
i18next.t('core.email.keyEscaped', { myVar: '<img />' });
// -> "no danger &lt;img &#x2F;&gt;"

// ok: i18next-key-format
i18next.t('core.email.keyUnescaped', { myVar: '<img />' });
// -> "dangerous <img />"

// ok: i18next-key-format
i18next.t('core.email.keyEscaped', { myVar: '<img />', interpolation: { escapeValue: false } });
// -> "no danger <img />" (obviously could be dangerous)

// ok: i18next-key-format
i18next.t('core.email.intlNumber', { val: 1000 });
// --> Some 1,000
// ok: i18next-key-format
i18next.t('core.email.intlNumber', { val: 1000.1, minimumFractionDigits: 3 });
// --> Some 1,000.100
// ok: i18next-key-format
i18next.t('core.email.intlNumber', { val: 1000.1, formatParams: { val: { minimumFractionDigits: 3 } } });
// --> Some 1,000.100
// ok: i18next-key-format
i18next.t('core.email.intlNumberWithOptions', { val: 2000 });
// --> Some 2,000.00
// ok: i18next-key-format
i18next.t('core.email.intlNumberWithOptions', { val: 2000, minimumFractionDigits: 3 });
// --> Some 2,000.000
