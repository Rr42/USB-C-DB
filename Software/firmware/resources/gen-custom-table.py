
fout = open("./output.dump", "w")

def write_out(str):
    print(str, file=fout)

write_out('server.sendContent("<p>Custom mode</p>\\n");')
write_out('server.sendContent("<table align=\\"center\\">\\n");')

LED_number = 1
for row in range(10):
    write_out('server.sendContent("    <tr>\\n");')
    for col in range(8):
        LED_name = str(LED_number)
        if LED_number < 10:
            LED_name = "0" + LED_name
        write_out('server.sendContent("        <th>\\n");')
        write_out(f'server.sendContent("            <select onchange=\\"change_color(this,value,{LED_name})\\" class=\\"dropdown\\">\\n");')
        write_out(f'server.sendContent("                <option style=\\"background-color:#000000);color:white\\" value=\\"#000000\\">{LED_name}</option>\\n");')
        write_out(f'server.sendContent("                <option style=\\"background-color:#0000FF);color:white\\" value=\\"#0000FF\\">{LED_name}</option>\\n");')
        write_out(f'server.sendContent("                <option style=\\"background-color:#00FF00);color:black\\" value=\\"#00FF00\\">{LED_name}</option>\\n");')
        write_out(f'server.sendContent("                <option style=\\"background-color:#00FFFF);color:black\\" value=\\"#00FFFF\\">{LED_name}</option>\\n");')
        write_out(f'server.sendContent("                <option style=\\"background-color:#FF0000);color:white\\" value=\\"#FF0000\\">{LED_name}</option>\\n");')
        write_out(f'server.sendContent("                <option style=\\"background-color:#FF00FF);color:black\\" value=\\"#FF00FF\\">{LED_name}</option>\\n");')
        write_out(f'server.sendContent("                <option style=\\"background-color:#FFFF00);color:black\\" value=\\"#FFFF00\\">{LED_name}</option>\\n");')
        write_out(f'server.sendContent("                <option style=\\"background-color:#FFFFFF);color:black\\" value=\\"#FFFFFF\\">{LED_name}</option>\\n");')
        write_out('server.sendContent("            </select>\\n");')
        write_out('server.sendContent("        </th>\\n");')
        # Increment the LED index
        LED_number +=1
    write_out('server.sendContent("    </tr>\\n");')
write_out('server.sendContent("</table>\\n");')

fout.close()
