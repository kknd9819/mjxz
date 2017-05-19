	<tr>
		<td>
			<label>创建日期从</label>
			<input type="text" id="beginDate" name="beginDate" class="Wdate" onfocus="WdatePicker({dateFmt: 'yyyy-MM-dd 00:00:00', maxDate: '#F{$dp.$D(\'endDate\')}'});" />
			<label>至</label>	
			<input type="text" id="endDate" name="endDate" class="Wdate" onfocus="WdatePicker({dateFmt: 'yyyy-MM-dd 23:59:59', minDate: '#F{$dp.$D(\'beginDate\')}'});" />
		</td>
		<td>
		    <label>订单编号:</label>
		    <input type="text" name="orderSn" id="orderSn"/>
		</td>
