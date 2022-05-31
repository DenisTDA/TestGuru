class SortTable {
  constructor(table, selector, iconsClass) {
    this.table = table
    this.cellTh = selector
    this.iconsClass =  iconsClass

    this.verify()
  }

  verify() {
    this.sortRowsByTitle()
    this.cellTh.addEventListener('click', event=> {
      this.sortRowsByTitle()
    })
  }

  sortRowsByTitle() {
    const tbody = this.table.querySelector('tbody')
    const rows = tbody.querySelectorAll('tr')
    const sortedRows = []
    
    for (let i = 0; i< rows.length; i++) {
      sortedRows.push(rows[i])
    }
    
    if (this.table.querySelector(this.iconsClass.up).classList.contains('hide')) {
      sortedRows.sort(this.compareRowsAsc)
      this.cellTh.querySelector(this.iconsClass.up).classList.remove('hide')
      this.cellTh.querySelector(this.iconsClass.down).classList.add('hide')
    } else {
      sortedRows.sort(this.compareRowsDesc)
      this.cellTh.querySelector(this.iconsClass.down).classList.remove('hide')
      this.cellTh.querySelector(this.iconsClass.up).classList.add('hide')
    } 
    
    this.table.removeChild(tbody)
    for (let i = 0; i <  sortedRows.length; i++) {
      tbody.appendChild(sortedRows[i])
    }
    this.table.appendChild(tbody)
  }
  
  compareRowsAsc(row1, row2) {
    const testTiitle1 = row1.querySelector('td').textContent
    const testTiitle2 = row2.querySelector('td').textContent
    return testTiitle1 < testTiitle2 ?  -1 : 1 
  }
  
  compareRowsDesc(row1, row2) {
    const testTiitle1 = row1.querySelector('td').textContent
    const testTiitle2 = row2.querySelector('td').textContent
    return testTiitle1 > testTiitle2 ?  -1 : 1 
  }
}
