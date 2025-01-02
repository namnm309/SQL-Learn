select st.SupplierTransactionID, st.SupplierID, st.TransactionType, st.TransactionDate, st.TransactionAmount
from SupplierTransactions st
where MONTH(st.TransactionDate) = 5 and st.TransactionDate between '2013-05-20' and '2013-05-31'
order by st.TransactionType asc, st.TransactionAmount desc