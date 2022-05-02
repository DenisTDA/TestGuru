document.addEventListener('turbolinks:load', function(){
  const iconsClass = { up : '.octicon-chevron-up', down : '.octicon-chevron-down' }
  const table = document.querySelector('table')
  const cellTh = table?.querySelector('.sort-by-title')
  if (table) { new SortTable(table, cellTh, iconsClass) }
})
