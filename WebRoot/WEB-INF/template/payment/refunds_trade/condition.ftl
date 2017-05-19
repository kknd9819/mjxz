	<tr>
		<td>
		    <label>退款编号:</label>
		    <input type="text" name="sn" id="sn"/>
		</td>
		<td>
		    <label>订单编号:</label>
		    <input type="text" name="orderSn" id="orderSn"/>
		</td>
		<td>
			<label>状态:</label>
			<select id="status" name="status">
				<option value="">全部</option> 
				<option value="0">待退款</option>
				<option value="1">退款成功</option>
				<option value="2">退款失败 </option>
			</select>
		</td>
		<td>
			<label>创建日期从</label>
			<input type="text" id="beginDate" name="beginDate" class="Wdate" onfocus="WdatePicker({dateFmt: 'yyyy-MM-dd 00:00:00', maxDate: '#F{$dp.$D(\'endDate\')}'});" />
			<label>至</label>	
			<input type="text" id="endDate" name="endDate" class="Wdate" onfocus="WdatePicker({dateFmt: 'yyyy-MM-dd 23:59:59', minDate: '#F{$dp.$D(\'beginDate\')}'});" />
		</td>
