document.addEventListener('turbolinks:load', function(){
  var control = document.querySelector('.sort-by-title')
  if (control) { control.addEventListener('click', sortRowsByTitle) }
})

function sortRowsByTitle() {
  var table = document.querySelector('table')
  var nameClass = table.className
  

  var rows = table.querySelectorAll('tr')
  var sortedRows = []
  
  for (var i = 1; i< rows.length; i++) {
    sortedRows.push(rows[i])
  }
  
  if (this.querySelector('.octicon-chevron-up').classList.contains('hide')) {
    sortedRows.sort(compareRowsAsc)
    this.querySelector('.octicon-chevron-up').classList.remove('hide')
    this.querySelector('.octicon-chevron-down').classList.add('hide')
  } else {
    sortedRows.sort(compareRowsDesc)
    this.querySelector('.octicon-chevron-down').classList.remove('hide')
    this.querySelector('.octicon-chevron-up').classList.add('hide')
  } 
    
  var sortedTable = document.createElement('table')

  sortedTable.className = nameClass
  sortedTable.appendChild(rows[0])
  console.log(rows[0])

  for (var i = 0; i <  sortedRows.length; i++) {
    sortedTable.appendChild(sortedRows[i])
  }

  table.parentNode.replaceChild(sortedTable,table)
}

function compareRowsAsc(row1, row2) {
  var testTiitle1 = row1.querySelector('td').textContent
  var testTiitle2 = row2.querySelector('td').textContent
  
  if (testTiitle1 < testTiitle2) { return -1 }
  if (testTiitle1 > testTiitle2) { return 1 }
  return 0
}

function compareRowsDesc(row1, row2) {
  var testTiitle1 = row1.querySelector('td').textContent
  var testTiitle2 = row2.querySelector('td').textContent
  
  if (testTiitle1 < testTiitle2) { return 1 }
  if (testTiitle1 > testTiitle2) { return -1 }
  return 0
}
