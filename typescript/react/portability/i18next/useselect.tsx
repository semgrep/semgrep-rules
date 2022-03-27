const {
  FormSelect: Amount,
  state: amount,
  setState: setAmount,
// ruleid: react-useselect-label-not-internationalized
} = useSelect('', [{ name: '10' }, { name: '50' }, { name: '100' }], 'Gift amount', '47%');

const {
  FormSelect: Currency,
  state: currency,
  setState: setCurrency,
// ok: react-useselect-label-not-internationalized
} = useSelect(
  '',
  [
    { name: 'EUR', fullName: 'Euro', symbol: '€' },
    { name: 'USD', fullName: 'US Dollars', symbol: '$' },
  ],
  t('gift.currency'),
  '47%',
);