class DbasesController < ApplicationController
  def index
    @dbases = Dbase.all #change Dbase.all to final hidden version fdb.all or left index as null with no code
  end

  def upload
    begin
      Dbase.upload(params[:file])
      redirect_to view_path, notice: 'Database uploaded.' # redirect to view_url(final hidden version fdb.all)
    rescue
      redirect_to root_url, notice: 'Invalid CSV file format.' # redirect to root_url showing error
    end
  end

  def view
    @fdb = []
    db = Dbase.all
    j = 1
    for i in 0..(db.size-2)
      puts "@@@@@@@@@@@i==== #{i}"
      fn1 = db[i].fname
      ln1 = db[i].lname
      rc1 = db[i].race
      gn1 = db[i].gender
      ssn1 = db[i].ssn
      dob1 = db[i].dob
      fn2 = db[i+1].fname
      ln2 = db[i+1].lname
      rc2 = db[i+1].race
      gn2 = db[i+1].gender
      ssn2 = db[i+1].ssn
      dob2 = db[i+1].dob
      puts 'fname'
      ffname = compare(fn1, fn2)
      puts 'lname'
      flname = compare(ln1, ln2)
      puts 'race'
      frace = compare(rc1, rc2)
      puts 'gender'
      fgender = compare(gn1, gn2)
      puts 'ssn'
      fssn = compare(ssn1, ssn2)
      puts 'dob'
      fdob = compare(dob1, dob2)
      hash = {:fid=>j, :ffname=>ffname, :flname=>flname, :frace=>frace, :fgender=>fgender, :fssn=>fssn, :fdob=>fdob}
      @fdb << hash
      j = j+1
      i = i+1
    end
  end

  def compare(one, two)
    if(one == NIL || two == NIL)
      return 'M'
    end
    fvalue = ''
    l1 = one.length
    l2 = two.length
    max = l1
    if(l2 > l1)
      max = l2
    end
    count = 0
    for i in 0..max-1
      puts "^^^^^^^^^^^^i==== #{i}"
      if(one[i] == two[i])
        fvalue[i] = '-'
      else
        count = count+1
        puts "count= #{count}"
        if(count == 1)
          fvalue[i] = 'D'
          index = i
        elsif(count == 2 and one[index] == two[i] and one[i] == two[index])
          fvalue[index] = 'T'
          fvalue[i] = 'X'
        else
          fvalue = 'Diff'
          return fvalue
        end
      end
    end
    return fvalue
  end

end
