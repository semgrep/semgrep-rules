const {
  FormSelect: Amount,
  state: amount,
  setState: setAmount,
// ruleid: useselect-label-not-i18n
} = useSelect('', [{ name: '10' }, { name: '50' }, { name: '100' }], 'Gift amount', '47%');

const {
  FormSelect: Currency,
  state: currency,
  setState: setCurrency,
// ok: useselect-label-not-i18n
} = useSelect(
  '',
  [
    { name: 'EUR', fullName: 'Euro', symbol: '€' },
    { name: 'USD', fullName: 'US Dollars', symbol: '$' },
  ],
  t('gift.currency'),
  '47%',
);
// ok: useselect-label-not-i18n
useSelect(
  '',
  [
    { name: 'EUR', fullName: 'Euro', symbol: '€' },
    { name: 'USD', fullName: 'US Dollars', symbol: '$' },
  ],
  '',
  '47%',
);
// ok: useselect-label-not-i18n
useSelect(
  '',
  [
    { name: 'EUR', fullName: 'Euro', symbol: '€' },
    { name: 'USD', fullName: 'US Dollars', symbol: '$' },
  ],
  '500.23',
  '47%',
);
// ok: useselect-label-not-i18n
useSelect(
  '',
  [
    { name: 'EUR', fullName: 'Euro', symbol: '€' },
    { name: 'USD', fullName: 'US Dollars', symbol: '$' },
  ],
  '500,23',
  '47%',
);
// ok: useselect-label-not-i18n
useSelect(
  '',
  [
    { name: 'EUR', fullName: 'Euro', symbol: '€' },
    { name: 'USD', fullName: 'US Dollars', symbol: '$' },
  ],
  '500-23',
  '47%',
);
// ok: useselect-label-not-i18n
useSelect(
  '',
  [
    { name: 'EUR', fullName: 'Euro', symbol: '€' },
    { name: 'USD', fullName: 'US Dollars', symbol: '$' },
  ],
  '30%',
  '47%',
);
