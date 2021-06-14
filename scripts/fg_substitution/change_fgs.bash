for DIR
do
    python /home/lukas/documents/molder/database_creation/change_fgs.py -d $DIR ${DIR%s_?f} ${DIR}_amine amine
    python /home/lukas/documents/molder/database_creation/change_fgs.py -d $DIR ${DIR%s_?f} ${DIR}_aldehyde aldehyde
    python /home/lukas/documents/molder/database_creation/change_fgs.py -d $DIR ${DIR%s_?f} ${DIR}_carboxylic_acid carboxylic_acid
    python /home/lukas/documents/molder/database_creation/change_fgs.py -d $DIR ${DIR%s_?f} ${DIR}_fluorine fluorine
    python /home/lukas/documents/molder/database_creation/change_fgs.py -d $DIR ${DIR%s_?f} ${DIR}_chlorine chlorine
    python /home/lukas/documents/molder/database_creation/change_fgs.py -d $DIR ${DIR%s_?f} ${DIR}_bromine bromine
    python /home/lukas/documents/molder/database_creation/change_fgs.py -d $DIR ${DIR%s_?f} ${DIR}_iodine iodine
    python /home/lukas/documents/molder/database_creation/change_fgs.py -d $DIR ${DIR%s_?f} ${DIR}_alcohol alcohol
done
