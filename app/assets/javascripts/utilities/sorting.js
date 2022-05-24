document.addEventListener('turbolinks:load', function(){
  const iconsClass = { up : '.octicon-chevron-up', down : '.octicon-chevron-down' }
  const table = document.querySelector('table')
  const cellTh = null
  if (table) { cellTh = table.querySelector('.sort-by-title') }
  if (cellTh) { new SortTable(table, cellTh, iconsClass) }
})
