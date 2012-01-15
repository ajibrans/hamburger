package com.hamburger.importer

import org.grails.plugins.excelimport.ExcelImportUtils
import org.grails.plugins.excelimport.*

class ExcelImporter extends AbstractExcelImporter {

//  static Map CONFIG_BOOK_CELL_MAP = [
//	 sheet:'Sheet1',
//	 cellMap: [ 'D3':'title',
//		'D4':'author',
//		'D6':'numSold',
//	  ]
//  ]
// 
  static Map CONFIG_BOOK_COLUMN_MAP = [
		  sheet:'Sheet1',
		  startRow: 1,
		  columnMap:  [
				  'B':'passportNo',
				  'C':'firstName',
				  'D':'lastName',
				  'E':'placeOfBirth',
				  'F':'dateOfBirth',
				  'G':'status',
				  'H':'sex',
				  
				  'J':'address',
				  'K':'postCode',
				  'L':'city',
				  'M':'occupation',
				  'N':'remark',
				  
				  'P':'issuingOffice',
				  'Q':'dateOfExpiry',
				  'R':'nameOfSpouse',
				  'S':'registrationNo',
				  'T':'registrationDate',
				  'U':'addressInIndonesia',
				  'V':'residencePermitType',
				  'W':'phoneNo',
				  'X':'phoneNoInIndonesia',
				  'Y':'religion',
				  'Z':'citizenshipStatus',
				  'AE':'dateOfResidencePermit',
				  'AF':'dateOfIssue'
		  ]
  ]

  public ExcelImporter(fileName) {
	super(fileName)
  }

  List<Map> getCitizens() {
	List bookList = ExcelImportUtils.convertColumnMapConfigManyRows(workbook, CONFIG_BOOK_COLUMN_MAP)
  }


//  Map getOneMoreBookParams() {
//	Map bookParams = ExcelImportUtils.convertFromCellMapToMapWithValues(workbook, CONFIG_BOOK_CELL_MAP )
//  }

}
