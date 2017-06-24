# https://www.codewars.com/kata/simplifying-multilinear-polynomials

def simplify(poly)
  r = poly.
    scan(/([+-]?)([0-9]*)([a-z]+)/).
    map { |opr, num, var| [(opr == '-' ? -1 : 1) * (num.empty? ? 1 : num).to_i, var.chars.sort.join] }.
    group_by { |n, v| v }.
    map { |v, ns| [v, ns.reduce(0) { |z, nv| z + nv[0] } ] }.
    select { |v, n| n != 0 }.
    sort_by { |v, n| v }.
    sort_by { |v, n| v.length }.
    map { |v, n| (n == -1 ? '-' : n == 1 ? '+' : n > 0 ? '+' + n.to_s : n.to_s) + v }.
    join
  r.start_with?('+') ? r[1..-1] : r
end
