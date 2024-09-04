select 
* 
from 
{{ ref("cleansed") }}
where 
PayerInitialBalance=0