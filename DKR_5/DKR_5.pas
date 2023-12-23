program DKR_5;

Uses CRT;

type
  mas = array [1..1000] of integer;

var
  m, out: text;
  ch: integer;


procedure SortCount;
var
  arr: array[-100..100] of integer; //arr[i] - количество чисел i в массиве
  i, j, x: integer;
begin
  Assign(m, 'маленький файл.txt');
  Reset(m);
  Writeln('Исходный массив: ');
  for i := -100 to 100 do   
    arr[i] := 0;
  while not eof(m) do 
  begin
    readln(m, x);
    write(x, ' ');
    inc(arr[x]);
  end;
  Assign(out, 'output.txt');
  ReWrite(out);
  Writeln;
  Writeln('Отсортированный массив: ');
  if ch = 1 then
  begin
    for i := -100 to 100 do
      for j := 1 to arr[i] do
      begin
        writeln(out, i);
        print(i);
      end;
  end;
  
  if ch = 2 then
  begin
    for i := 100 downto -100 do
      for j := 1 to arr[i] do
      begin
        writeln(out, i);
        print(i);
      end;
  end;
  writeln;
  writeln;
  writeln('Отсортированные данные записаны в c:\output.txt');
  close(out);
  close(m);
end;

procedure QuickSort(var a: mas; p, q: integer);
var
  i, j, x, temp: integer;
begin
  i := p;
  j := q;
  x := a[(p + q) div 2];
  repeat
    while a[i] < x do
      i := i + 1;
    while a[j] > x do
      j := j - 1;
    if i <= j then
    begin
      temp := a[i];
      a[i] := a[j];
      a[j] := temp;
      i := i + 1;
      j := j - 1;
    end;
  until i > j;
  if p < j then
    QuickSort(a, p, j);
  if i < q then
    QuickSort(a, i, q);
end;

procedure QuickSortWrapper;
var
  a: mas;
  n, i, x: integer;
begin
  clrscr;
  Writeln('Исходный массив: ');
  Assign(m, 'маленький файл.txt');
  Reset(m);
  n := 0;
  repeat
    readln(m, x);
    inc(n);
  until eof(m);
  Reset(m);
  for i := 1 to n do
  begin
    readln(m, a[i]);
    print(a[i]);
  end;
  close(m);
  writeln;
  QuickSort(a, 1, N);
  writeln('Отсортированный массив:');
  Assign(out, 'output.txt');
  ReWrite(out);
  if ch = 1 then
  begin
    for i := 1 to n do
    begin
      Writeln(out, a[i]);
      print(a[i]);
    end;
  end;
  if ch = 2 then
  begin
    for i := n downto 1 do
    begin
      Writeln(out, a[i]);
      print(a[i]);
    end;
  end;
  writeln;
  writeln;
  writeln('Отсортированные данные записаны в c:\output.txt');
  close(out);
end;

begin
  repeat
    ClrScr;
    Writeln('1. Сортировка подсчетом');
    Writeln('2. Сортировка быстрым алгоритмом');
    Writeln('3. Выход');
    Write('Выберите пункт: ');
    Readln(ch);
    case ch of
      1:
        begin
          clrscr; 
          Writeln('1. Отсортировать по возрастанию');
          Writeln('2. Отсортировать по убыванию');
          Write('Выберите пункт: ');
          Readln(ch);
          case ch of 
            1:
              begin
                ClrScr;
                SortCount;
                Readln;
              end;
            
            2:
              begin;
                ClrScr;
                SortCount;
                Readln;
              end;
          end;
        end;
      
      2:
        begin
          clrscr; 
          Writeln('1. Отсортировать по возрастанию');
          Writeln('2. Отсортировать по убыванию');
          Write('Выберите пункт: ');
          Readln(ch);
          case ch of 
            1:
              begin
                ClrScr;
                QuickSortWrapper;
                Readln;
              end;
            
            2:
              begin;
                ClrScr;
                QuickSortWrapper;
                Readln;
              end;
          end;
        end;
      
      3: exit;
    end;
  until ch = 3;
end.
